<?php
declare(strict_types=1);

namespace Example\Pet;

class Dog extends Animal
{
    public function bark(): string
    {
        return 'I woof.';
    }

    public function forceBark(): string
    {
        return 'I very-very woof-woof-woof!';
    }

    public function run(): string
    {
        return 'I run.';
    }

    public function swim(): string
    {
        return 'I swim.';
    }
}
