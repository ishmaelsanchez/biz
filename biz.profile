<?php

/**
 * Set default install profile.
 *
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  // Hide default drupal profiles
  //unset($form['profile']['Standard']);
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function biz_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name and email address.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = 'support@ninjitsuweb.com';

  // Account information defaults
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'support@ninjitsuweb.com';
  
  // Date/time settings
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los Angeles';
  
  // Remove email noticiations
  unset($form['update_notifications']['update_status_module']['2']);
  
  //// Unset the timezone detect stuff
  //unset($form['server_settings']['date_default_timezone']['#attributes']['class']);
}

/**
 * Implements hook_install_tasks().
 * 
 * Adds on to the install process
 */
function biz_install_tasks() {
  $tasks = array(
    'biz_client_form' => array(
      'display_name' => st('Setup Client'),
      'type' => 'form',
    ),
  );
  return $tasks;
}

/**
 * Implements hook_install_tasks().
 * 
 * Custom form for additional configuration
 */
function biz_client_form() {
  $form = array();
  $form['intro'] = array(
    '#markup' => '<p>' . st('Setup your default client account below.') . '</p>',
  );
  $form['client_name'] = array(
    '#type' => 'textfield',
    '#title' => st('Client Username'),
    '#required' => TRUE,
  );
  $form['client_mail'] = array(
    '#type' => 'textfield',
    '#title' => st('Client E-mail Address'),
    '#required' => TRUE,
  );
  $form['client_pass'] = array(
    '#type' => 'password',
    '#title' => st('Client Password'),
  );
  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Continue'),
  );
  return $form;
}

/**
 * Form validation
 * 
 */
function biz_client_form_validate($form, &$form_state) {
  if (!valid_email_address($form_state['values']['client_mail'])) {
    form_set_error('client_mail', st('Please enter a valid email address'));
  }
}

function biz_client_form_submit($form, &$form_state) {
  $values = $form_state['values'];

  // Setup the user account array to programatically create a new user.
  $account = array(
    'name' => $values['client_name'],
    'pass' => !empty($values['client_pass']) ? $values['client_pass'] : user_password(),
    'mail' => $values['client_mail'],
    'status' => 1,
    'init' => $values['client_mail'],
  );
  $account = user_save(null, $account);

  // Assign the client to the "administrator" role.
  $role = user_role_load_by_name('administrator');
  db_insert('users_roles')
    ->fields(array('uid' => $account->uid, 'rid' => $role->rid))
    ->execute();
}
