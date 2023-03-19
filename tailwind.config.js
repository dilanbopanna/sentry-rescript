const plugin = require("tailwindcss/plugin");
module.exports = {
  darkMode: "class",
  content: ["./src/**/*.js"],
  theme: {
    extend: {},
  },
  plugins: [
    plugin(function ({ addUtilities }) {
      const newUtilities = {
        ".no-scrollbar::-webkit-scrollbar": {
          display: "none",
        },
        ".show-scrollbar::-webkit-scrollbar": {
          overflow: "scroll",
          height: "4px",
          width: "4px",
        },
        ".show-scrollbar::-webkit-scrollbar-thumb": {
          borderRadius: "2px",
          backgroundColor: "#9A9FA8",
        },
      };
      addUtilities(newUtilities);
    }),
  ],
}
