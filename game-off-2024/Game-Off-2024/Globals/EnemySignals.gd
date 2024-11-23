extends Node

#FIXME make more useful signals that pass useful data.
signal enemyArrived()
signal enemyArrivalFinsihed(enemy: TargetEnemy)
signal killEnemy(enemy: TargetEnemy)
signal enemySeesPlayer(player:Player)
signal playerOutOfSight()
