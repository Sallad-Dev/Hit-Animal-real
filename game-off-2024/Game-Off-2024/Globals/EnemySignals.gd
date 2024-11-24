extends Node

#FIXME make more useful signals that pass useful data.
signal enemyArrived()
signal enemyArrivalFinsihed(enemy: Enemy)
signal killEnemy(enemy: Enemy)
signal enemySeesPlayer(player:Player)
signal playerOutOfSight()
