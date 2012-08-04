<?php

/**
 * Set default install profile.
 *
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  // Hide default Drupal profiles
  unset($form['profile']['Standard']);
  unset($form['profile']['Minimal']);
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function biz_form_install_configure_form_alter(&$form, $form_state) {
  // Call a base profile
  // Base install profile see http://drupal.org/node/906106
//  $file = "./profiles/fm_install/fm_install.profile";
//  if (file_exists($file)){
//    require_once($file);
//  }
  // Pre-populate the site name and email address.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = '';

  // Account information defaults
  $form['admin_account']['account']['name']['#default_value'] = '';
  $form['admin_account']['account']['mail']['#default_value'] = '';
  
  // Date/time settings
  $form['server_settings']['site_default_country']['#default_value'] = 'US';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los Angeles';
  
  // Many modules set messages during installation we reset them
  drupal_get_messages('status');
  drupal_get_messages('warning');
  
  // Unset the timezone detect stuff
  //unset($form['server_settings']['date_default_timezone']['#attributes']['class']);

  // Opt out of e-mail notifications 
  $form['update_notifications']['update_status_module']["#default_value"]['1'] = '0';
 
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
  
  // For good measure
  drupal_flush_all_caches();
  drupal_cron_run();
}

/**
 * Implements hook_install_tasks_alter()
 */
function biz_install_tasks_alter(&$tasks, $install_state) {
  // Insert install task to set theme
//  $tasks['install_load_profile'][] = 'biz_profile_theme';
//
//  $tasks['biz_profile_theme']['run'] = INSTALL_TASK_RUN_IF_REACHED;
  // Since we only offer one language, define a callback to set this
  //$tasks['install_select_locale']['function'] = 'biz_locale_selection';

//  $tasks['install_finished']['function'] = 'biz_done';
//  $tasks['install_finished']['display_name'] = t('Finished!');
//  $tasks['install_finished']['type'] = 'form';
}

/**
 * Task to set a custom maintenance theme for styling the profile
 */
//function biz_profile_theme() {
//  $themes = list_themes();
//  $theme = $themes['biz_profile'];
//  _drupal_theme_initialize($theme);
//}

/**
 * Form to choose the starting theme from list of available options
 */
//function biz_theme_form($form, &$form_state) {
//
//  // Create list of theme options, minus admin + testing + starter themes
//  $themes = array();
//  foreach(system_rebuild_theme_data() as $theme) {
//    if (!in_array($theme->name, array('test_theme', 'update_test_basetheme', 'update_test_subtheme', 'block_test_theme', 'stark', 'seven'))) {
//      $themes[$theme->name] = theme('image', array('path' => $theme->info['screenshot'])) . '<strong>' . $theme->info['name'] . '</strong><br><p><em>' . $theme->info['description'] . '</em></p><p class="clearfix"></p>';
//    }
//  }
//
//  $form['theme'] = array(
//    '#title' => t('Starting Theme'),
//    '#type' => 'radios',
//    '#options' => $themes,
//    '#default_value' => 'panopoly_default',
//  );
//
//  $form['submit'] = array(
//    '#type' => 'submit',
//    '#value' => 'Choose theme',
//  );
//
//  return $form;
//}

/**
 * Form to choose the starting theme
 */
//function biz_theme_configure_form($form, &$form_state) {
//  $theme = variable_get('theme_default');
//  ctools_include('system.admin', 'system', '');
//  $form = system_theme_settings($form, $form_state, $theme); 
//  return $form;
//}


/**
 * Form submit handler to select the theme
 */
//function biz_theme_form_submit($form, &$form_state) {
//  
//  // Enable and set the theme of choice
//  $theme = $form_state['input']['theme'];
//  theme_enable(array($theme));
//  variable_set('theme_default', $theme);
// 
//  // Flush theme caches so things are right
//  system_rebuild_theme_data();
//  drupal_theme_rebuild();
//}
//  ADDS a default block
//  /**
//  * Implements hook_block_info()
//  */
//  function openenterprise_block_info() {
//  $blocks['powered-by'] = array(
//    'info' => t('Powered by OpenEnterprise'),
//    'weight' => '10',
//    'cache' => DRUPAL_NO_CACHE,
//  );
//  return $blocks;
//  }
//
//  /**
//  * Implements hook_block_view().
//  */
//  function openenterprise_block_view($delta = '') {
//  $block = array();
//  switch ($delta) {
//    case 'powered-by':
//      $block['subject'] = NULL;
//      $block['content'] = '<span>' . t('Powered by <a href="http://apps.leveltendesign.com/project/openenterprise" target="_blank">OpenEnterprise</a>. A distribution by <a href="http://www.leveltendesign.com" target="_blank">LevelTen Interactive</a>') . '</span>';
//      return $block;
//  }
//  }
//
//  // Set some default cache settinsg
//  $cache_vars = array(
//    'block_cache' => 1,
//    'cache' => 1,
//    'cache_lifetime' => 60,
//    'page_cache_maximum_age' => 3600,
//    'preprocess_css' => 1,
//    'preprocess_js' => 1,
//  );
//
//  foreach ($cache_vars as $var => $value) {
//    variable_set($var, $value);
//  }