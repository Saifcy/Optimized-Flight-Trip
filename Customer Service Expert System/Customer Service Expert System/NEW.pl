%Starting_point_of_the_program
start :-
    write('Press any key to continue '),
    get_single_char(_),
    main_menu.




%Main_menu_handler
main_menu :-
    welcome_message,
    write('Would you like to see a list of issues in each category? (y/n)'), nl,
    read(Answer),
    handle_main_menu_choice(Answer).




%displaying_the_welcome_message
welcome_message :-
    write('----------------------------------------------------------------------------------------------------------------'), nl,
    write('****************************************************************************************************************'), nl,
    write('---------------------------------------E-payments and digital finance solutions---------------------------------'), nl,
    write('------------------------------------------Welcome to Customer Service Support-----------------------------------'), nl,
    write('****************************************************************************************************************'), nl,
    write('----------------------------------------------------------------------------------------------------------------'), nl,
    write('----------------------------------------------------------------------------------------------------------------'), nl,
    write('----------------------------------------------------------------------------------------------------------------'), nl.




%Predicate_to_handle_the_main_menu_choice
handle_main_menu_choice('y') :-
    write('Would you like to continue or see the list of issues? (y/n)'), nl,
    read(Answer),
    handle_continue_or_list(Answer).

handle_main_menu_choice('n') :-
    prompt_for_issue.


%Predicate_to_handle_continue_or_list_choice
handle_continue_or_list('n') :-
    prompt_for_issue.

handle_continue_or_list('y') :-
    display_all_issues,
    prompt_for_issue.

handle_continue_or_list(_) :-
    write('Invalid choice. Please enter "y" or "n".'), nl,
    handle_main_menu_choice('y'). % Restart the choice




%Rule_to_handle_another_issues
handle_another_issues('n') :-
    write('Thank you for contacting customer service.').

handle_another_issues('y') :-
    prompt_for_issue.

handle_another_issues(_) :-
    write('Invalid choice. Please enter "y" or "n".'), nl,
    read(Answer),
    handle_another_issues(Answer).




%Rule_to_prompt_the_user_to_enter_their_issue
prompt_for_issue :-
    write('Please enter your issue:'), nl,
    read(Issue),
    handle_query(Issue).









%Function_to_handle_user_queries
handle_query(Issue) :-
    (
        issue(Category, Issue),
        resolve_issue(Category),nl,
        write('Do you have another issue? (y/n) '), nl, read(Answer) ,handle_another_issues(Answer));
       (write('Sorry, I couldn\'t find a solution for that issue.'), nl, display_all_issues, prompt_for_issue).




%Function_to_display_all_issues_in_each_category
display_all_issues :-
    write('List of available issues:'), nl,
    display_issues(account_management),
    display_issues(billing),
    display_issues(security),
    display_issues(subscription),
    display_issues(support),
    display_issues(troubleshooting).




%Function_to_display_issues_for_a_specific_category
display_issues(Category) :-
    write('Category: '), write(Category), nl,
    forall(issue(Category, Issue), (write('- '), write(Issue), nl)).




%Facts_about_various_categories_of_issues
%Account_Management
issue(account_management, 'I forgot my password').
issue(account_management, 'I need to update my contact information').
issue(account_management, 'I want to change my email address').
issue(account_management, 'I want to delete my account').

%Billing
issue(billing, 'How much does it charge per transaction?').
issue(billing, 'Vouchers and Promo codes').
issue(billing, 'I want to request a refund').

%Security
issue(security, 'I need help with two-factor authentication').
issue(security, 'I think someone signed into my account').

%Subscription
issue(subscription, 'I want to cancel my subscription').
issue(subscription, 'I want to upgrade/downgrade my subscription').

%Support
issue(support, 'I want to contact customer support').
issue(support, 'I want to provide feedback or suggestions').

%Troubleshooting
issue(troubleshooting, 'My device keeps restarting').
issue(troubleshooting, 'There is a system crash in my area').




%Predicate_for_resolving_issues_based_on_category
resolve_issue(account_management) :-
    write('To resolve account management issues:'), nl,
    write('1. Visit the account settings page.'), nl,
    write('2. Follow the instructions to reset your password/change your email address/update contact information/delete account, etc.'), nl,
    write('3. If you need further assistance, contact customer support at 19754.'), nl.

resolve_issue(billing) :-
    write('To resolve billing issues, contact our billing department at 19754.'), nl.

resolve_issue(security) :-
    write('To manage security settings, visit our website\'s security page.'), nl.

resolve_issue(subscription) :-
    write('To change subscription plans, visit your nearest branch. For locations, check our website or contact customer support.'), nl.

resolve_issue(support) :-
    write('For customer support, visit our website\'s support page or call our hotline at 19754.'), nl.

resolve_issue(troubleshooting) :-
    write('For technical support, call 19754 and press #.'), nl.
















