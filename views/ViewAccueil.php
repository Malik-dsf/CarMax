<?php
foreach($produits as $produit): ?>
<h2>nom model :<?php echo($produit->getNom()) ?></h2>
<h3>prix :<?= $produit->getPrix() ?></h3>
<h3>img :<?php echo($produit->getNom()) ?></h3>

<?php endforeach; ?>