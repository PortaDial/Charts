<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>
    <form action="${url.applicationsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">

        <div class="CardList">
            <#list applications.applications as application>
                <#if application.effectiveUrl?has_content>
                    <a class="bx--tile bx--tile--clickable Card" href="${application.effectiveUrl}">
                        <svg focusable="false" preserveAspectRatio="xMidYMid meet" style="will-change: transform;"
                             class="Icon"
                             xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"
                             aria-hidden="true">
                            <path d="M16 18H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2zM6 6v10h10V6zm20 6v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2zm0 12v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2zm-10 2v4h-4v-4h4m0-2h-4a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2z"></path>
                        </svg>
                        <span class="ApplicationTitle">
                            <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                        </span>
                    </a>
                </#if>
            </#list>
        </div>

    </form>

</@layout.mainLayout>
