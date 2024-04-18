<?php

foreach($produits as $produit): ?>
<h2><?= $produit->getId() ?></h2>
<h2><?= $produit->getNom() ?></h2>
<?php endforeach; ?>