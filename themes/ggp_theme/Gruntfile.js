module.exports = function(grunt) {
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    less: {
      dist: {
        files: {
          'css/responsive.css': ['less/responsive.less'],
          'css/style.css': ['less/style.less']
        }
      }
    },
    cssmin: {
      minify: {
        expand: true,
        files: {
          'css/responsive.min.css': ['css/responsive.css'],
          'css/style.min.css': ['css/style.css']
        }
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-cssmin');

  grunt.registerTask('css', ['less', 'cssmin']);
  // Default task(s).
  grunt.registerTask('default', ['css']);
};
