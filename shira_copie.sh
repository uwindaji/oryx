#!/bin/sh


date=$(date '+%Y-%m-%d')
hour=$(date +"%T")

menu () {
    # start script
    echo -e "app is ready what do you want to do? ->

            \033[36m 1. Create a new project\033[0m
            \033[36m 2. Open a project\033[0m"

    echo "

Enter option (exp '1' for Create a new project) ->"; 
    read request
    return $request
}


choiceProject () {
    
    case $1 in
        1) createClass $2;;
        2) loadPackage $2;;
        3) loadModul $2;; #________________________________________________________
        4) createModul $2 ;;
        *) echo -e "\033[31mInvalid option ! ->\033[0m" ;;
    esac
}


menuProject () {
    # start script
    echo -e $1" is ready what do you want to do? ->
    
            \033[36m 1. Create a new class\033[0m
            \033[36m 2. load a new package\033[0m
            \033[36m 3. load a new modul html\033[0m
            \033[36m 4. create a new modul html\033[0m"

    echo "

Enter option (exp '1' for Create a new project) ->"; 
    read request
    choiceProject $request $1
}

# check folder or file param String
checkFolder () {

    if [ -d $1 ];
    then
        return 0
    else
        return 1
    fi
}

checkFile () {

    if [ -f $1 ];
    then
        return 0
    else
        return 1
    fi
}



#________________________________________ project ___________________________
# script for a new project
# function to create a new project
generateProject () {


    

    #create folders
    mkdir ./$projectName
    mkdir ./$projectName/css
    mkdir ./$projectName/img
    mkdir ./$projectName/js
    mkdir ./$projectName/php
    mkdir ./$projectName/php/kernel
    mkdir ./$projectName/php/kernel/packages
    mkdir ./$projectName/php/kernel/classes
    mkdir ./$projectName/php/kernel/db
    mkdir ./$projectName/php/controlers
    mkdir ./$projectName/php/models
    mkdir ./$projectName/php/views


    #create files in folders
    touch ./$projectName/css/styles.css
    touch ./$projectName/css/styles.query.css
    touch ./$projectName/js/app.js
    touch ./$projectName/php/kernel/db/db_connect.php
    touch ./$projectName/php/controlers/Rooter.php
    touch ./$projectName/php/views/Head.php
    touch ./$projectName/php/views/Footer.php
    touch ./$projectName/index.php

    #insert code in db_connect.php
    echo -e '
    <?php
    // name of project '$projectName'.
    // Author :  lakhdar.
    // Create in  '$date' ******* AT '$hour'.
    // Contact : lakhdar-rouibah@live.fr.
    // Web : rouibah.fr

    $host = "'$hostname'";
    $user = "'$username'";
    $password = "'$password'";
    $host = "'$db_name'";
    '>> ./$projectName/php/kernel/db/db_connect.php

    #insert code in Rooter.php
    echo -e '
    <?php

    // name of project '$projectName'.
    // Author :  lakhdar.
    // Create in  '$date' ******* AT '$hour'.
    // Contact : lakhdar-rouibah@live.fr.
    // Web : rouibah.fr

    class Rooter {
        /**
         * Rooter to recovred view and model
         *
         * @param [String] $req
         */
        public function __construct($req) {
            // recovred the view
            require_once "./php/views/".$req."/.php";
            // recovred the model
            require_once "./php/models/".$req."/.php";
        }
    }'>> ./$projectName/php/controlers/Rooter.php



    if [ $boots = 'y' ]
    then

            wget -P ./$projectName/css https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css
            wget -P ./$projectName/js https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js

            wget -P ./$projectName/js https://code.jquery.com/jquery-3.3.1.slim.min.js
            wget -P ./$projectName/js https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js

            btcss='./css/bootstrap.min.css'
            btjs='./js/bootstrap.min.js'
            jq='./js/jquery-3.3.1.slim.min.js'
            popper='./js/popper.min.js'

    #insert code in Head.php
    echo -e '
    <!DOCTYPE html>
    <html lang="'$language'">
    <head>
        <!--

        // name of project '$projectName'.
        //Script create by lakhdar.
        // Date '$date' ******* at '$hour'.
        // Contact: lakhdar-rouibah@live.fr.
        // Web : rouibah.fr
        -->

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>'$title'</title>
        <link rel="stylesheet" href="'$btcss'">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./css/styles.query.css">
    </head>
    <body>\n
        '>> ./$projectName/php/views/Head.php

    #insert code in Head.php
    echo -e '
    <script src="'$jq'"></script>
    <script src="'$popper'"></script>
    <script src="'$btjs'"></script>
    <script src="./js/app.js"></script>
    </body>
    </html>
    '>> ./$projectName/php/views/Footer.php
            
    else
    #insert code in Head.php
    echo -e '
    <!DOCTYPE html>
    <html lang="'$language'">
    <head>
        <!--
        // name of project '$projectName'.
        //Script create by lakhdar.
        // Date '$date' ******* at '$hour'.
        // Contact: lakhdar-rouibah@live.fr.
        // Web : rouibah.fr
        -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>'$title'</title>
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./css/styles.query.css">
    </head>
    <body>\n
        '>> ./$projectName/php/views/Head.php

    #insert code in Head.php
    echo -e '<script src="./js/app.js"></script>
    </body>
    </html>
    '>> ./$projectName/php/views/Footer.php
    fi



    #insert code in index.php
    echo -e '<?php

    // name of project '$projectName'.
    //Script create by Lakhdar.
    // Date '$date' ******* at '$hour'.
    // Contact: lakhdar-rouibah@live.fr.
    // Web : rouibah.fr

    require_once "./php/kernel/db/db_connect.php";
    require_once "./php/controlers/Rooter.php";
    require_once "./php/views/Head.php";

    if(isset($_POST["request"])){
        // here recovred your request POST in variable $request
        $request = $_POST["request"];
        /* exp:
        switch ($request){
            case "*** here set name of view ho is the same of controler ***":
            // set name of variable to your object and set parameters in  new Rooter
            $variable = new Rooter("*** here set name of view ho is the same of controler ***"); // the Rooter load model and view requesteds
            //here recovred the $_POST["*** name of the POST ***"] in a variabel
            # // exp: $variabel = $_POST["name"];
            //here set the parameters of your class
            $upload = new class (*** parapeters of your calss **);
            break;
        }
        */
    }

    require_once "./php/views/Footer.php";'>> ./$projectName/index.php

    echo 'project create with success ->';
    menuProject $projectName
}

# function to add a new 
addProject () {

    checkFolder $projectName
    _check=$?
    if [ $_check -eq 0 ];
    then
        echo -e "\033[31mProject name existe choose another name ! ->\033[0m"
        read projectName
        addProject $projectName

    elif [ $_check -eq 1 ];
    then
        #create project
        echo "set your language exp: fr for french or en for english ->"
        read language

        # echo "Enter project name ->"
        # read projectName

        echo "Enter host name ->"
        read hostname

        echo "Enter username ->"
        read username

        echo "Enter password ->"
        read password

        echo "Enter data base name ->"
        read db_name

        echo "set the title of your application ->"
        read title

        echo "do you need bootstrap ? set (y) for yes ->"
        read boots 

        generateProject $projectName
    fi
}

# function to open Project
openProject () {

    echo "Enter the name of project ->"
    read projectName

    checkFolder $projectName
    if [ $? -eq 0 ];
    then 

        menuProject $projectName
    else 
        echo -e "\033[31mProject not exist ! ->\033[0m"
        openProject
    fi

}

#_______________________________________ class ______________________________
# script for a new class
# function to create a new class
createClass() {

    project=$1

    echo $project
    echo 'Enter class name'
    read className

    checkFile ./$project/php/kernel/classes/$className.php
    if [ $? -eq 0 ];
    then
        echo -e "\033[31mClass name existe choose another name ! ->\033[0m"
        createClass

    elif [ $? -eq 1 ];
    then

    echo 'Enter the comment for class ->'
    read comment

    touch ./$project/php/kernel/classes/$className.php

    #insert code in class
    echo -e '
    <?php

    // name of project '$project'.
    // Script create by lakhdar.
    // Create in '$date' ******* at '$hour'.
    // Contact: lakhdar-rouibah@live.fr.
    // Web : rouibah.fr

    // Comment of class : '$comment'.
    class '$className'{

        public function __construct (){


        }
    }
    '>> ./$project/php/kernel/classes/$className.php

    echo 'Create class success'
    menuProject $project
    fi
}

#______________________________________ Modul ______________________________
# function to create modul
createModul () {
    
    project=$1
    echo 'Enter the name of modul'
    read modulName
    
    checkFile ./$project/php/views/$modulName.php
    modulHtml=$?
    checkFile ./$project/php/models/$modulName.php
    modulPhp=$?
    if [ $modulHtml -eq 0 -o $modulPhp -eq 0 ];
    then
        echo -e "\033[31mModul name existe choose another name ! ->\033[0m"
        createModul $project

    elif [ $modulHtml -eq 1 -a $modulPhp -eq 1 ];
    then

        echo 'Enter the description of modul ->'
        read description
        touch ./$project/php/models/$modulName.php
        touch ./$project/php/views/$modulName.php

#insert code in modul
echo -e '<?php
// name of project '$project'.
// Author :  lakhdar.
// Create in  '$date' ******* AT '$hour'.
// Contact : lakhdar-rouibah@live.fr.
// Web : rouibah.fr

// '$description'
class '$modulName' {
    public function __construct() {
        
    }
}'>> ./$project/php/models/$modulName.php

echo -e '<!-- here your code HTML -->'>> ./$project/php/views/$modulName.php

        echo 'Create Modul success'
        menuProject $project
    fi
}
# function to load a new package
loadPackage() {

    project=$1
    echo 'Enter the name of package'
    read packageName

    checkFile ./$project/php/kernel/package/$packageName.php
    if [ $? -eq 0 ];
    then
        echo -e "\033[31mPackage existe choose another package ! ->\033[0m"
        loadPackage $project

    elif [ $? -eq 1 ];
    then
        wget -P ./$project/php/kernel/package/ https://raw.githubusercontent.com/lakhdar-rouibah/rouibah/master/mini_mvc/$packageName.php
        menuProject $project
    fi
}



#___________________________________________________________
menu
case $? in
	1) 
        echo "Enter project name ->"
        read projectName
        addProject $projectName;;

	2) openProject;;
	*) echo -e "\033[31mInvalid option ! ->\033[0m" ;;
esac
#___________________________________________________________




