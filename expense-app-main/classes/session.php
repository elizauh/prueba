<?php

class Session
{

    private $sessionName = "user";

    public function __construct()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
    }

    public function setCurrentUser($user)
    {
        $_SESSION[$this->sessionName] = $user;
    }

    public function getCurrentUser()
    {
        //este metodo lo arreglé
        if (!isset($_SESSION[$this->sessionName])) {
            error_log("CLASSES::getCurrentUser -> NO existe el parametro user de session de usuario actual");            
            $session = NULL;
        } else {
            $session = $_SESSION[$this->sessionName];
        }

        return $session;
        //return $_SESSION[$this->sessionName];
    }

    public function closeSession()
    {
        session_unset();
        session_destroy();
    }

    public function exists()
    {
        return isset($_SESSION[$this->sessionName]);
    }
}
