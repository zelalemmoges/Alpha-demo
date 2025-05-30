// Import and register all your controllers from the importmap via controllers/**/*_controller
import { Application } from "@hotwired/stimulus"

// Automatically load all controllers from the current directory and subdirectories
const application = Application.start()

const context = require.context("./", true, /\.js$/)

context.keys().forEach((key) => {
  const controller = context(key).default
  const controllerName = key
    .replace(/^.\//, "")         // remove leading './'
    .replace(/\.js$/, "")        // remove .js extension
    .replace(/_/g, "-")          // optional: convert underscores to dashes
  application.register(controllerName, controller)
})

export { application }


