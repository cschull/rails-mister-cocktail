// app/javascript/components/init_select2.js
import $ from 'jquery';
// finding any element on the page with a select2 class and setting it up as a select 2 element
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
};

export { initSelect2 };
