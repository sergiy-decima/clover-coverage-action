<?php
declare(strict_types=1);

namespace Example\Pet;

abstract class Animal
{
    use NameTrait;

    private bool $predator;

    public function __construct(string $name, bool $predator)
    {
        $this->name = $name;
        $this->predator = $predator;
    }

    public function eat()
    {
        if ($this->predator) {
            return 'I eat food. I like meat.';
        } else {
            return 'I eat food. I like vegetables.';
        }
    }
}
