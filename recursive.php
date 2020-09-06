<?php

class CategoryTree
{
    private $tree;

    public function __construct(string $root = null)
    {
        $this->tree = [];
    }

    /**
     * @throws InvalidArgumentException
     */

    public function addCategory(string $category, string $parent = null): void
    {
        if (in_array($category, array_column($this->tree, 'category'))) {
            throw new InvalidArgumentException("This Category is already registered: {$category}");
        }

        $this->tree [] = ['parent' => $parent, 'category' => $category];
    }

    public function getChildren(string $parent): array
    {
        return array_column(array_filter($this->tree, function ($node)  use ($parent)
        {
            return $node['parent'] === $parent;
        }), 'category');
    }
}


$c = new CategoryTree();
$c->addCategory('A', null);
//$c->addCategory('A', null);
$c->addCategory('B', 'A');
$c->addCategory('C', 'A');
$c->addCategory('X', 'B');
$c->addCategory('Y', 'B');
//$c->addCategory('Y', 'X');
echo implode(',', $c->getChildren('A'));
echo implode(',', $c->getChildren('B'));
