const li = document.querySelectorAll(".navbar-menu li");
console.log(li);
function activeLink() {
  li.forEach((item) =>
    item.classList.remove("active")
  );
  this.classList.add("active");
}

li.forEach((item) => {
  item.addEventListener("click", activeLink);
});

document.addEventListener('DOMContentLoaded', function() {
  const navbarToggle = document.querySelector('.navbar-toggle');
  const sidebar = document.querySelector('.sidebar');

  navbarToggle.addEventListener('click', function() {
    sidebar.classList.toggle('sidebar-open');
  });
});
