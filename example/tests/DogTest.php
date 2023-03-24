<?php
declare(strict_types=1);

namespace Example\Pet\Test;

use PHPUnit\Framework\TestCase;

class DogTest extends TestCase
{
    public function testBark()
    {
        $this->assertEquals('I woof.', $this->createTestObject()->bark());
    }

    public function testForceBark()
    {
        $this->assertEquals('I very-very woof-woof-woof!', $this->createTestObject()->forceBark());
    }

    public function testRun()
    {
        $this->assertEquals('I run.', $this->createTestObject()->run());
    }

    public function testSwim()
    {
        $this->assertEquals('I swim.', $this->createTestObject()->swim());
    }

    public function testEat()
    {
        $this->assertEquals('I eat food. I like meat.', $this->createTestObject()->eat());
    }
    protected function createTestObject(): \Example\Pet\Dog
    {
        return new \Example\Pet\Dog('Jimmy Chew', true);
    }
}
