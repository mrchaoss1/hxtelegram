package telegram.types;

/**
 * Describes the position of a clickable area within a story.
 */
typedef StoryAreaPosition = {
  /** The abscissa of the area's center, as a percentage of the media width */
  x_percentage:Float,
  /** The ordinate of the area's center, as a percentage of the media height */
  y_percentage:Float,
  /** The width of the area's rectangle, as a percentage of the media width */
  width_percentage:Float,
  /** The height of the area's rectangle, as a percentage of the media height */
  height_percentage:Float,
  /** The clockwise rotation angle of the rectangle, in degrees; 0-360 */
  rotation_angle:Float,
  /** The radius of the rectangle corner rounding, as a percentage of the media width */
  corner_radius_percentage:Float,
}
