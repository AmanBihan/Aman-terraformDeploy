AOS.init({ duration: 1000 });

// Shooting stars animation
const canvas = document.getElementById('starCanvas');
const ctx = canvas.getContext('2d');
let width, height;

function resizeCanvas() {
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
}
window.addEventListener('resize', resizeCanvas);
resizeCanvas();

const stars = Array.from({ length: 100 }, () => ({
  x: Math.random() * width,
  y: Math.random() * height,
  r: Math.random() * 1.5,
  d: Math.random() * 0.5 + 0.5
}));

function drawStars() {
  ctx.clearRect(0, 0, width, height);
  ctx.fillStyle = '#ffffff88';
  stars.forEach(s => {
    ctx.beginPath();
    ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
    ctx.fill();
    s.x -= s.d;
    s.y += s.d;
    if (s.x < 0 || s.y > height) {
      s.x = Math.random() * width;
      s.y = 0;
    }
  });
  requestAnimationFrame(drawStars);
}
drawStars();

let lastScrollY = window.scrollY;
  const navbar = document.getElementById('navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY > lastScrollY) {
        navbar.classList.add('hide');
    } else {
        navbar.classList.remove('hide');
    }
    lastScrollY = window.scrollY;
    });
