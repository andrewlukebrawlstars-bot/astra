/* THEME */
document.getElementById("themeToggle").onclick = () => {
  document.body.classList.toggle("light");
};

/* STARS */
const canvas = document.getElementById("stars");
const ctx = canvas.getContext("2d");

let w, h, stars;

function resize() {
  w = canvas.width = window.innerWidth;
  h = canvas.height = window.innerHeight;
  stars = Array.from({ length: 150 }, () => ({
    x: Math.random() * w,
    y: Math.random() * h,
    r: Math.random() * 1.5,
    v: Math.random() * 0.3 + 0.1
  }));
}
window.onresize = resize;
resize();

function animate() {
  ctx.clearRect(0, 0, w, h);
  ctx.fillStyle = "white";

  stars.forEach(s => {
    s.y += s.v;
    if (s.y > h) s.y = 0;
    ctx.beginPath();
    ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
    ctx.fill();
  });

  requestAnimationFrame(animate);
}
animate();



