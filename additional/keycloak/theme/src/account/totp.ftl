<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>
    <h1 class="GreetingsMessage NoMargin">
        ${msg("authenticatorTitle")}
    </h1>

    <#if totp.enabled>
        <table class="bx--data-table">
            <thead>
                <tr>
                    <th><span class="bx--table-header-label">${msg("configureAuthenticators")}</span></th>
                    <th><span class="bx--table-header-label">Label</span></th>
                    <th><span class="bx--table-header-label">Options</th>
                </tr>
            </thead>
            <tbody>
            <#list totp.otpCredentials as credential>
                <tr>
                    <td class="provider">${msg("mobile")}</td>
                    <#if totp.otpCredentials?size gt 1>
                        <td class="provider">${credential.id}</td>
                    </#if>
                    <td class="provider">${credential.userLabel!}</td>
                    <td class="bx--table-column-menu">
                        <form action="${url.totpUrl}" method="post" class="form-inline">
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                            <input type="hidden" id="credentialId" name="credentialId" value="${credential.id}">

                            <button
                                class="bx--btn bx--btn--danger bx--btn--icon-only bx--btn--sm">
                                    <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform; fill: white;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" aria-hidden="true"><path d="M6 6H7V12H6zM9 6H10V12H9z"></path><path d="M2 3v1h1v10c0 .6.4 1 1 1h8c.6 0 1-.4 1-1V4h1V3H2zM4 14V4h8v10H4zM6 1H10V2H6z"></path></svg>
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <#else>

    <ol>
        <#if mode?? && mode = "manual">
            <li>
                <p>${msg("totpManualStep2")}</p>
                <p><span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
                <p><a href="${totp.qrUrl}" id="mode-barcode">${msg("totpScanBarcode")}</a></p>
            </li>
            <li>
                <p>${msg("totpManualStep3")}</p>
                <ul>
                    <li id="kc-totp-type">${msg("totpType")}: ${msg("totp." + totp.policy.type)}</li>
                    <li id="kc-totp-algorithm">${msg("totpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                    <li id="kc-totp-digits">${msg("totpDigits")}: ${totp.policy.digits}</li>
                    <#if totp.policy.type = "totp">
                        <li id="kc-totp-period">${msg("totpInterval")}: ${totp.policy.period}</li>
                    <#elseif totp.policy.type = "hotp">
                        <li id="kc-totp-counter">${msg("totpCounter")}: ${totp.policy.initialCounter}</li>
                    </#if>
                </ul>
            </li>
        <#else>
            <li>
                <p>${msg("totpStep2")}</p>
                <div class="bx--tile"><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"></div>
                <p><a href="${totp.manualUrl}" id="mode-manual">${msg("totpUnableToScan")}</a></p>
            </li>
        </#if>
        <li>
            <p>${msg("totpStep3")}</p>
            <p>${msg("totpStep3DeviceName")}</p>
        </li>
    </ol>

    <form action="${url.totpUrl}" class="form-horizontal TotpForm" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <div class="form-group">
            <div class="col-sm-2 col-md-2">
                <label for="totp" class="control-label bx--label">${msg("authenticatorCode")}</label> <span class="required">*</span>
            </div>

            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control bx--text-input" id="totp" name="totp" autocomplete="off" autofocus>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}"/>
            </div>


        </div>

        <div class="form-group" ${messagesPerField.printIfExists('userLabel',properties.kcFormGroupErrorClass!)}">
            <div class="col-sm-2 col-md-2">
                <label for="userLabel" class="control-label bx--label">${msg("totpDeviceName")}</label> <#if totp.otpCredentials?size gte 1><span class="required">*</span></#if>
            </div>
            <div class="col-sm-10 col-md-10">
                <input type="text" class="form-control bx--text-input" id="userLabel" name="userLabel" autocomplete="off">
            </div>
        </div>
        <br/>
        <div class="form-group DisplayFlex">
            <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                <div class="">
                    <button type="submit"
                            class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} bx--btn bx--btn--primary"
                            id="saveTOTPBtn" name="submitAction" value="Save">${msg("doSave")}
                    </button>
                    <button type="submit"
                            class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!} bx--btn bx--btn--tertiary"
                            id="cancelTOTPBtn" name="submitAction" value="Cancel">${msg("doCancel")}
                    </button>
                </div>
            </div>
        </div>
    </form>
    </#if>
</@layout.mainLayout>