# tech-stack-golang-fastapi-postgresql

##### Testing the frontend app:

To test the frontend app and its functionalities, you can use a tool like `vue-test-utils` to write unit tests for your Vue components. 

Here's an example of how you can write a unit test for your `Login.vue` component:

```javascript
import { shallowMount } from '@vue/test-utils';
import Login from '@/views/Login.vue';

describe('Login.vue', () => {
  it('renders the login form', () => {
    const wrapper = shallowMount(Login);
    expect(wrapper.find('form').exists()).toBe(true);
  });

  it('displays the app name', () => {
    const wrapper = shallowMount(Login);
    expect(wrapper.find('h1').text()).toMatch(process.env.VUE_APP_NAME);
  });

  it('submits the login form', () => {
    const wrapper = shallowMount(Login);
    const emailInput = wrapper.find('#email');
    const passwordInput = wrapper.find('#password');
    const submitButton = wrapper.find('button[type="submit"]');

    emailInput.setValue('test@example.com');
    passwordInput.setValue('password');
    submitButton.trigger('click');

    expect(wrapper.emitted('login')).toBeTruthy();
    expect(wrapper.emitted('login')[0]).toEqual([{ email: 'test@example.com', password: 'password' }]);
  });
});
```

In this example, we're testing that the login form is properly rendered, that the app name is displayed, and that the login form can be submitted with the correct data. 

You can run your tests using a command like `npm run test:unit` or `yarn test:unit`. 