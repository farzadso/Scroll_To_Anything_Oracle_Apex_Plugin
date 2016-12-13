set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>12850352582744363083
,p_default_application_id=>9468
,p_default_owner=>'EXPERIMENTAL'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_jafr_scroll_to_anything
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(49558140334230811031)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.JAFR.SCROLL.TO.ANYTHING'
,p_display_name=>'Scroll To Anything'
,p_category=>'NAVIGATION'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'function render_scroll_to (',
'  p_dynamic_action in apex_plugin.t_dynamic_action,',
'  p_plugin         in apex_plugin.t_plugin',
'  ) return apex_plugin.t_dynamic_action_render_result ',
'is',
'  v_result apex_plugin.t_dynamic_action_render_result;',
'  l_apex_version varchar2(50) := p_dynamic_action.attribute_01; -- Universal Theme or Legacy Themes',
'  l_speed varchar2(50) := p_dynamic_action.attribute_02; -- Animation Speed',
'  l_code varchar2(5000);',
'begin',
'  if l_apex_version = ''apexV'' then',
'    l_code := ''function() {',
'    var x = this.affectedElements;',
'    $("html, body").animate({scrollTop: (x.offset().top - $(".t-Header").height())}, %SPEED%);',
'    } '';',
'    l_code := replace(l_code, ''%SPEED%'', l_speed);',
'    v_result.javascript_function := l_code;',
'  elsif l_apex_version = ''apexIV'' then',
'    l_code := ''function() {',
'    var x = this.affectedElements;',
'    $("html, body").animate({scrollTop: (x.offset().top)}, %SPEED%);',
'    } '';',
'    l_code := replace(l_code, ''%SPEED%'', l_speed);',
'    v_result.javascript_function := l_code;',
'  end if;',
'return v_result;',
'end render_scroll_to;',
'  '))
,p_render_function=>'render_scroll_to'
,p_standard_attributes=>'ITEM:BUTTON:REGION:JQUERY_SELECTOR:JAVASCRIPT_EXPRESSION:TRIGGERING_ELEMENT:EVENT_SOURCE:REQUIRED:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'This is a very lightweight Dynamic Action plugin for scrolling to any element on the page. (Buttons, Items, Regions, jQuery Selectors, etc.)',
'',
'Don''t forget to provide feedback on my github page.'))
,p_version_identifier=>'0.1'
,p_about_url=>'https://github.com/farzadso/Scroll_To_Anything_Oracle_Apex_Plugin'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(49558433655532227237)
,p_plugin_id=>wwv_flow_api.id(49558140334230811031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'APEX Version'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'apexV'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'- Select APEX Version -'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(49558435206592228056)
,p_plugin_attribute_id=>wwv_flow_api.id(49558433655532227237)
,p_display_sequence=>10
,p_display_value=>'APEX 5.0+'
,p_return_value=>'apexV'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(49558435582991228753)
,p_plugin_attribute_id=>wwv_flow_api.id(49558433655532227237)
,p_display_sequence=>20
,p_display_value=>'APEX 4'
,p_return_value=>'apexIV'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(49558446861718809070)
,p_plugin_id=>wwv_flow_api.id(49558140334230811031)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Animation Speed'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'1500'
,p_display_length=>8
,p_max_length=>8
,p_unit=>'milliseconds'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
