<?php

class bootstrapForm extends Form
{

    protected function surround($html)
    {
        return "<div class=\"form-field mb-3\">{$html}</div>";
    }

    public function input($type, $name, $phld)
    {
        return $this->surround(
            '<label for="' . $name . '" class="mb-2" >' . $phld . '</label><br><input class="form-control" type="' . $type . '" name="' . $name . '" id="' . $name . '" value="' . $this->getValue($name) . '">'
        );
    }

    public function inputPassword($name, $phld)
    {
        return $this->surround(
            '<input class="form-control" type="password" name="' . $name . '" placeholder="' . $phld . '">'
        );
    }
}