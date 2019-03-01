(function ($) {
    $.validationEngineLanguage.allRules["ajaxEmailControl"] = {
        "url": "/User/ValidateUserMail",
        "extraDataDynamic": ['#Email', '#Id'],
        "alertText": translationsValidation["ajaxEmailControl"].alertText,
        "alertTextOk": translationsValidation["ajaxEmailControl"].alertTextOk,
        "alertTextLoad": translationsValidation["ajaxEmailControl"].alertTextLoad

    };
    $.validationEngineLanguage.allRules["ajaxUsernameControl"] = {
        "url": "/User/ValidateUserName",
        "extraDataDynamic": ['#Username', '#Id'],
        "alertText": translationsValidation["ajaxUsernameControl"].alertText,
        "alertTextOk": translationsValidation["ajaxUsernameControl"].alertTextOk,
        "alertTextLoad": translationsValidation["ajaxUsernameControl"].alertTextLoad

    };
})(jQuery);