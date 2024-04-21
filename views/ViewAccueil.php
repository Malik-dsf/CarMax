<?php
foreach($produits as $produit): ?>
<h2>nom model :<?= $produit->getNom() ?></h2>
<h2>prix :<?= $produit->getPrix() ?></h2>
<?php endforeach; ?>