// Theme override script to persist user preference
// This fixes the issue where browser dark mode preference overrides user selection

(function () {
  // Check if user has a saved preference
  const savedTheme = localStorage.getItem("theme-preference");

  if (savedTheme) {
    // Apply saved theme immediately to prevent flash
    document.documentElement.setAttribute("data-bs-theme", savedTheme);
  }

  // Wait for DOM to be ready
  document.addEventListener("DOMContentLoaded", function () {
    // Find all theme toggle buttons
    const themeToggles = document.querySelectorAll("[data-bs-theme-value]");

    themeToggles.forEach((toggle) => {
      toggle.addEventListener("click", function (e) {
        e.preventDefault();
        const theme = this.getAttribute("data-bs-theme-value");

        // Save preference
        localStorage.setItem("theme-preference", theme);

        // Apply theme
        document.documentElement.setAttribute("data-bs-theme", theme);

        // Update active states
        themeToggles.forEach((t) => t.classList.remove("active"));
        this.classList.add("active");
      });
    });

    // Set initial active state based on saved preference
    if (savedTheme) {
      themeToggles.forEach((toggle) => {
        if (toggle.getAttribute("data-bs-theme-value") === savedTheme) {
          toggle.classList.add("active");
        } else {
          toggle.classList.remove("active");
        }
      });
    }
  });
})();
