<?php
foreach($produits as $produit): ?>
<h2>nom model :<?= $produit->getnom() ?></h2>
<h2>prix :<?= $produit->getprix() ?></h2>
<?php endforeach; ?>