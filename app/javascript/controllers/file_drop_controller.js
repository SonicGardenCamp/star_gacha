import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['fileUpload']

  dragover(e) {
    e.preventDefault()

    // dragover したときに border の色を変える
    this.fileUploadTarget.classList.add('border-primary')
  }

  dragleave(e) {
    e.preventDefault()
    this.fileUploadTarget.classList.remove('border-primary')
  }

  drop(e) {
    e.preventDefault()
    this.fileUploadTarget.classList.remove('border-primary')

    const files = e.dataTransfer.files
    if (typeof files[0] !== 'undefined') {
      this.fileUploadTarget.files = files
    }
  }
}
