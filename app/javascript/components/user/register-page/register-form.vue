<template>
  <div>
    <form novalidate class="md-layout" @submit.prevent="validateUser">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title">Register</div>
        </md-card-header>

        <md-card-content>
          <md-field :class="getValidationClass('email')">
            <label for="email">Email</label>
            <md-input type="email" name="email" id="email" autocomplete="email" v-model="form.email"
                      :disabled="sending"/>
            <span class="md-error" v-if="!$v.form.email.required">The email is required</span>
            <span class="md-error" v-else-if="!$v.form.email.email">Invalid email</span>
          </md-field>

          <md-field :class="getValidationClass('password')">
            <label for="password">Password</label>
            <md-input type="password" name="password" id="password" autocomplete="password" v-model="form.password"
                      :disabled="sending"/>
            <span class="md-error" v-if="!$v.form.password.required">The password is required</span>
            <span class="md-error" v-else-if="!$v.form.password.password">Invalid password</span>
          </md-field>

          <md-field :class="getValidationClass('confirmPassword')" :md-toggle-password="false">
            <label for="confirmPassword">Password</label>
            <md-input type="password" name="confirmPassword" id="confirmPassword" autocomplete="confirmPassword"
                      v-model="form.confirmPassword" :disabled="sending" placeholder="Confirm Password"/>
            <span class="md-error" v-if="!$v.form.confirmPassword.required">The confirmPassword is required</span>
            <span class="md-error" v-else-if="!$v.form.confirmPassword.confirmPassword">Passwords don't match</span>
          </md-field>
        </md-card-content>

        <md-progress-bar md-mode="indeterminate" v-if="sending"/>

        <md-card-actions>
          <md-button type="submit" class="md-primary" :disabled="sending">Register</md-button>
        </md-card-actions>
      </md-card>

      <md-snackbar :md-active.sync="registerFailed">{{ errorMessage }}</md-snackbar>
      <md-snackbar :md-active.sync="registerSucceeded">You have successfully registered</md-snackbar>
    </form>
  </div>
</template>

<script>
import {validationMixin} from 'vuelidate'
import {
  required,
  email,
  minLength,
  maxLength,
  sameAs
} from 'vuelidate/lib/validators'
import axios from "axios";
import {routesBuilder} from "../../../routesBuilder";
import {setUser} from "../../../utils/auth";

export default {
  mixins: [validationMixin],
  data: () => ({
    form: {
      email: null,
      password: null,
    },
    sending: false,
    registerFailed: false,
    registerSucceeded: false,

    errorMessage: 'Error',
    userExists: false
  }),
  validations: {
    form: {
      password: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(100),
      },
      confirmPassword: {
        required,
        sameAs: sameAs('password')
      },
      email: {
        required,
        email,
        maxLength: maxLength(100)
      },
    }
  },
  methods: {
    getValidationClass(fieldName) {
      const field = this.$v.form[fieldName]

      if (field) {
        return {
          'md-invalid': field.$invalid && field.$dirty
        }
      }
    },
    async handleSubmit() {
      this.sending = true

      try {
        const response = await axios.post(routesBuilder.api.auth.register.root, {
          email: this.form.email,
          password: this.form.password,
        })
        setUser(response.data)
        this.registerSucceeded = true
        await this.$router.push({name: 'home'})
      } catch (error) {
        this.errorMessage = error.response.data.errors.base
        this.userExists = true
        this.registerFailed = true
        this.sending = false
      }
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
</style>