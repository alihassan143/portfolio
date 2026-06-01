// GitHub-style animated globe / network canvas for the About section
(function () {
  'use strict';

  var canvas = document.getElementById('globe-canvas');
  if (!canvas) return;

  var ctx = canvas.getContext('2d');
  var W, H, cx, cy, radius;
  var nodes = [], edges = [], particles = [];
  var RAF;

  /* ── Sizing ─────────────────────────────────────────── */
  function resize() {
    // Read the canvas's own CSS display size so buffer matches display exactly.
    var size = 520;
    W = canvas.width  = size;
    H = canvas.height = size;
    cx = W / 2; cy = H / 2;
    radius = Math.min(W, H) * 0.42;
    init();
  }

  /* ── Sphere → 2-D projection ─────────────────────────── */
  function sphere(lat, lon, r) {
    var x = r * Math.cos(lat) * Math.cos(lon);
    var y = r * Math.sin(lat);
    var z = r * Math.cos(lat) * Math.sin(lon);
    // simple perspective
    var fov = 800;
    var scale = fov / (fov + z);
    return { x: cx + x * scale, y: cy - y * scale, z: z, scale: scale };
  }

  /* ── Initialise nodes, edges, particles ──────────────── */
  function init() {
    nodes = []; edges = []; particles = [];

    // Globe dot grid
    for (var lat = -80; lat <= 80; lat += 18) {
      var cols = Math.max(1, Math.round(Math.cos(lat * Math.PI / 180) * 20));
      for (var i = 0; i < cols; i++) {
        var lon = (i / cols) * 360 - 180;
        nodes.push({
          lat: lat  * Math.PI / 180,
          lon: lon  * Math.PI / 180,
          baseLon: lon * Math.PI / 180,
          size: 1.5 + Math.random() * 1.5,
          pulse: Math.random() * Math.PI * 2,
          pulseSpeed: 0.015 + Math.random() * 0.025,
          alpha: 0.3 + Math.random() * 0.5,
        });
      }
    }

    // Random arc edges between nearby nodes
    for (var j = 0; j < nodes.length; j++) {
      for (var k = j + 1; k < nodes.length; k++) {
        var dlat = nodes[j].lat - nodes[k].lat;
        var dlon = nodes[j].lon - nodes[k].lon;
        if (Math.sqrt(dlat*dlat + dlon*dlon) < 0.45 && Math.random() < 0.25) {
          edges.push({ a: j, b: k });
        }
      }
    }

    // Flying activity particles (commit / PR dots)
    for (var p = 0; p < 12; p++) spawnParticle();
  }

  function spawnParticle() {
    var a = Math.floor(Math.random() * nodes.length);
    var b = Math.floor(Math.random() * nodes.length);
    particles.push({
      a: a, b: b,
      t: 0,
      speed: 0.004 + Math.random() * 0.007,
      size: 3 + Math.random() * 3,
      color: Math.random() < 0.6 ? '#7c3aed' : '#22d3ee',
      trail: [],
    });
  }

  /* ── Rotation ─────────────────────────────────────────── */
  var rotY = 0;
  var rotSpeed = 0.0015;

  /* ── Draw ─────────────────────────────────────────────── */
  function draw() {
    ctx.clearRect(0, 0, W, H);
    rotY += rotSpeed;

    // Apply rotation to all nodes
    var projected = nodes.map(function (n) {
      var lon = n.baseLon + rotY;
      return sphere(n.lat, lon, radius);
    });

    // Draw edges (only front-facing)
    ctx.lineWidth = 0.6;
    edges.forEach(function (e) {
      var pa = projected[e.a], pb = projected[e.b];
      if (pa.z < -radius * 0.1 || pb.z < -radius * 0.1) return;
      var alpha = Math.min(pa.scale, pb.scale) * 0.4;
      ctx.beginPath();
      ctx.moveTo(pa.x, pa.y);
      ctx.lineTo(pb.x, pb.y);
      ctx.strokeStyle = 'rgba(124,58,237,' + alpha + ')';
      ctx.stroke();
    });

    // Draw nodes
    nodes.forEach(function (n, i) {
      n.pulse += n.pulseSpeed;
      var p = projected[i];
      if (p.z < -radius * 0.15) return;
      var vis = ((p.z + radius) / (2 * radius));
      var glow = 0.5 + 0.5 * Math.sin(n.pulse);
      var s = n.size * p.scale;
      var alpha = n.alpha * vis;

      if (glow > 0.85 && vis > 0.6) {
        // Pulsing "hot" node
        var gr = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, s * 5);
        gr.addColorStop(0, 'rgba(34,211,238,' + (alpha * 0.8) + ')');
        gr.addColorStop(1, 'rgba(34,211,238,0)');
        ctx.beginPath();
        ctx.arc(p.x, p.y, s * 5, 0, Math.PI * 2);
        ctx.fillStyle = gr;
        ctx.fill();
      }

      ctx.beginPath();
      ctx.arc(p.x, p.y, s, 0, Math.PI * 2);
      ctx.fillStyle = 'rgba(167,139,250,' + (alpha * (0.6 + 0.4 * glow)) + ')';
      ctx.fill();
    });

    // Draw activity particles (flying along edges)
    particles = particles.filter(function (p) {
      p.t += p.speed;
      if (p.t > 1) { spawnParticle(); return false; }
      var pa = projected[p.a], pb = projected[p.b];
      if (!pa || !pb) return false;
      if (pa.z < -radius * 0.1 || pb.z < -radius * 0.1) return false;

      var x = pa.x + (pb.x - pa.x) * p.t;
      var y = pa.y + (pb.y - pa.y) * p.t;
      p.trail.push({ x: x, y: y });
      if (p.trail.length > 12) p.trail.shift();

      // Draw trail
      for (var i = 0; i < p.trail.length - 1; i++) {
        var alpha = (i / p.trail.length) * 0.6;
        ctx.beginPath();
        ctx.moveTo(p.trail[i].x, p.trail[i].y);
        ctx.lineTo(p.trail[i+1].x, p.trail[i+1].y);
        ctx.strokeStyle = p.color.replace(')', ',' + alpha + ')').replace('rgb(', 'rgba(').replace('#7c3aed', 'rgba(124,58,237,').replace('#22d3ee', 'rgba(34,211,238,');
        ctx.lineWidth = 1.5;
        ctx.stroke();
      }

      // Draw dot head
      var gr = ctx.createRadialGradient(x, y, 0, x, y, p.size * 2);
      gr.addColorStop(0, p.color);
      gr.addColorStop(1, 'transparent');
      ctx.beginPath();
      ctx.arc(x, y, p.size * 2, 0, Math.PI * 2);
      ctx.fillStyle = gr;
      ctx.fill();

      ctx.beginPath();
      ctx.arc(x, y, p.size * 0.6, 0, Math.PI * 2);
      ctx.fillStyle = '#fff';
      ctx.fill();

      return true;
    });

    RAF = requestAnimationFrame(draw);
  }

  /* ── Boot ─────────────────────────────────────────────── */
  window.addEventListener('resize', function () {
    cancelAnimationFrame(RAF);
    resize();
    draw();
  });
  resize();
  draw();
})();
