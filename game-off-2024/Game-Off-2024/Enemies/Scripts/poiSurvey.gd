extends PointOfInterest
class_name POISurvey

#makes enemy survey the area
func on_arrival(enemy: Enemy):
	enemy.poi_survey()
