<?php
class Login extends SessionController
{

    function __construct()
    {
        parent::__construct();
        error_log("Login::construct -> Inicio de login");
    }

    function render()
    {
        error_log("Login::render -> Carga el index de login");
        $this->view->render("login/index");
    }

    function authenticate()
    {
        if ($this->existPOST("username", "password")) {
            $username = trim($this->getPost("username"));
            $password = $this->getPost("password");

            if ($username == '' || empty($username) || $password == '' || empty($password)) {
                $this->redirect('', ['error' => ErrorMessages::ERROR_LOGIN_AUTHENTICATE_EMPTY]);
            }

            //validacion de datos
            if (
                preg_match('/^[\w+0-9]+$/', $username)
                && preg_match('/^[0-9a-zA-Z]+$/', $password)
            ) {

                $user = $this->model->login($username, $password);
                if ($user != NULL) {
                    $this->initialize($user);
                } else {
                    $this->redirect('', ['error' => ErrorMessages::ERROR_LOGIN_AUTHENTICATE_DATA]);
                }
            } else {
                $this->redirect('', ["error" => ErrorMessages::ERROR_SANITIZING_FIELDS]);
            }
        } else {
            $this->redirect('', ['error' => ErrorMessages::ERROR_LOGIN_AUTHENTICATE]);
        }
    }
}
