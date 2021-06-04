<template>
  <div class="image-form">
    <form novalidate class="md-layout" @submit.prevent="validateUser">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title">New Image</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('header')">
                <label for="header">Header</label>
                <md-input name="header" id="header" autocomplete="given-name" v-model="form.header"
                          :disabled="sending"/>
                <span class="md-error" v-if="!$v.form.header.required">The header is required</span>
                <span class="md-error" v-else-if="!$v.form.header.minlength">Invalid header</span>
              </md-field>
            </div>
          </div>

          <md-field :class="getValidationClass('image')">
            <label>Only images</label>
            <md-file accept="image/*" @change="setImage" :value="form.image ? form.image.name : null"/>
          </md-field>
        </md-card-content>

        <md-progress-bar md-mode="indeterminate" v-if="sending"/>

        <md-card-actions>
          <md-button type="submit" class="md-primary" :disabled="sending">Post image</md-button>
        </md-card-actions>
      </md-card>

      <md-snackbar :md-active.sync="imageSaved">The user {{ lastImage }} was saved with success!</md-snackbar>
    </form>
  </div>
</template>

<script>
import {validationMixin} from 'vuelidate'
import {
  required,
  minLength,
  maxLength
} from 'vuelidate/lib/validators'
import axios from "axios";
import {routesBuilder} from "../../routesBuilder";

export default {
  name: 'FormValidation',
  mixins: [validationMixin],
  data: () => ({
    single: null,
    form: {
      header: null,
      image: null,
    },
    imageSaved: false,
    sending: false,
    lastImage: null,
  }),
  validations: {
    form: {
      header: {
        required,
        minLength: minLength(3)
      },
      image: {
        required,
      }
    }
  },
  methods: {
    setImage(event) {
      this.form.image = event.target.files[0];
    },
    getValidationClass(fieldName) {
      const field = this.$v.form[fieldName]

      if (field) {
        return {
          'md-invalid': field.$invalid && field.$dirty
        }
      }
    },
    clearForm() {
      this.$v.$reset()
      this.form.header = null
      this.form.image = null
      this.imageName = null
    },
    formReset() {
      this.lastImage = `${this.form.header}`
      this.imageSaved = true
      this.sending = false
      this.clearForm()
    },
    async handleSubmit(event) {
      this.sending = true
      {
        const data = new FormData();
        data.append('image_post[header]', this.form.header);
        data.append('image_post[image]', this.form.image);

        await axios.post(routesBuilder.api.imagePosts.root, data);
      }
      this.formReset()
      this.$emit('updatePosts');
    },
    validateUser() {
      this.$v.$touch()

      if (!this.$v.$invalid) {
        this.handleSubmit()
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.md-progress-bar {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
}
.image-form {
  margin-bottom: 3rem;
}
</style>