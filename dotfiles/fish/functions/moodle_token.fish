function moodle_token --description "Takes domain and password and curls back a token for a moodle instance" -a domain user pass
    echo "running script with: $domain, $user $pass"
    set url_pass (string escape --style=url $pass)
    echo "url_pass: $domain, $user, $pass"
    set url "https://$domain/login/token.php?username=$user&password=$url_pass&service=moodle_mobile_app"
    echo $url
    echo ""
    # curl $url
    set response (curl $url)
    echo $response
end
