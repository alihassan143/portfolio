// Animated globe factory — drives any number of canvas elements
(function () {
  'use strict';

  function createGlobe(canvasId, opts) {
    var canvas = document.getElementById(canvasId);
    if (!canvas) return;

    var ctx = canvas.getContext('2d');
    var size   = opts.size   || 520;
    var W, H, cx, cy, radius;
    var nodes = [], edges = [], particles = [];
    var RAF;

    /* ── Sizing ───────────────────────────────────────────── */
    function resize() {
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
      var fov = 800;
      var scale = fov / (fov + z);
      return { x: cx + x * scale, y: cy - y * scale, z: z, scale: scale };
    }

    /* ── Initialise nodes, edges, particles ──────────────── */
    function init() {
      nodes = []; edges = []; particles = [];

      for (var lat = -80; lat <= 80; lat += 18) {
        var cols = Math.max(1, Math.round(Math.cos(lat * Math.PI / 180) * 20));
        for (var i = 0; i < cols; i++) {
          var lon = (i / cols) * 360 - 180;
          nodes.push({
            lat:       lat * Math.PI / 180,
            baseLon:   lon * Math.PI / 180,
            size:      1.5 + Math.random() * 1.5,
            pulse:     Math.random() * Math.PI * 2,
            pulseSpeed:0.015 + Math.random() * 0.025,
            alpha:     0.3 + Math.random() * 0.5,
          });
        }
      }

      for (var j = 0; j < nodes.length; j++) {
        for (var k = j + 1; k < nodes.length; k++) {
          var dlat = nodes[j].lat - nodes[k].lat;
          var dlon = nodes[j].baseLon - nodes[k].baseLon;
          if (Math.sqrt(dlat*dlat + dlon*dlon) < 0.45 && Math.random() < 0.25) {
            edges.push({ a: j, b: k });
          }
        }
      }

      for (var p = 0; p < 12; p++) spawnParticle();
    }

    function spawnParticle() {
      var a = Math.floor(Math.random() * nodes.length);
      var b = Math.floor(Math.random() * nodes.length);
      particles.push({
        a: a, b: b,
        t: 0,
        speed: 0.004 + Math.random() * 0.007,
        size:  3 + Math.random() * 3,
        color: Math.random() < 0.6 ? 'rgba(124,58,237,' : 'rgba(34,211,238,',
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

      var projected = nodes.map(function (n) {
        return sphere(n.lat, n.baseLon + rotY, radius);
      });

      // Edges
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

      // Nodes
      nodes.forEach(function (n, i) {
        n.pulse += n.pulseSpeed;
        var p = projected[i];
        if (p.z < -radius * 0.15) return;
        var vis  = (p.z + radius) / (2 * radius);
        var glow = 0.5 + 0.5 * Math.sin(n.pulse);
        var s    = n.size * p.scale;
        var alpha = n.alpha * vis;

        if (glow > 0.85 && vis > 0.6) {
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

      // Particles
      particles = particles.filter(function (pt) {
        pt.t += pt.speed;
        if (pt.t > 1) { spawnParticle(); return false; }
        var pa = projected[pt.a], pb = projected[pt.b];
        if (!pa || !pb) return false;
        if (pa.z < -radius * 0.1 || pb.z < -radius * 0.1) return false;

        var x = pa.x + (pb.x - pa.x) * pt.t;
        var y = pa.y + (pb.y - pa.y) * pt.t;
        pt.trail.push({ x: x, y: y });
        if (pt.trail.length > 12) pt.trail.shift();

        for (var i = 0; i < pt.trail.length - 1; i++) {
          var a = (i / pt.trail.length) * 0.6;
          ctx.beginPath();
          ctx.moveTo(pt.trail[i].x, pt.trail[i].y);
          ctx.lineTo(pt.trail[i+1].x, pt.trail[i+1].y);
          ctx.strokeStyle = pt.color + a + ')';
          ctx.lineWidth = 1.5;
          ctx.stroke();
        }

        var gr2 = ctx.createRadialGradient(x, y, 0, x, y, pt.size * 2);
        gr2.addColorStop(0, pt.color + '1)');
        gr2.addColorStop(1, 'rgba(0,0,0,0)');
        ctx.beginPath();
        ctx.arc(x, y, pt.size * 2, 0, Math.PI * 2);
        ctx.fillStyle = gr2;
        ctx.fill();

        ctx.beginPath();
        ctx.arc(x, y, pt.size * 0.6, 0, Math.PI * 2);
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
  }

  // Hero background globe — large, subtle
  createGlobe('hero-globe-canvas', { size: 680 });

  // About section globe — right-side accent
  createGlobe('about-globe-canvas', { size: 520 });

})();
