extends Node2D
class_name PointOfInterest

#generic on arrival function
func on_arrival(enemy: Enemy):
	#by default, enemy walks to the point and then leaves straight away
	await get_tree().create_timer(0.1).timeout
	EnemySignals.enemyArrivalFinsihed.emit(enemy)
