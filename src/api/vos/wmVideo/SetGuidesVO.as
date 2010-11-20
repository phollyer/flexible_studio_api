package swfStudio.vos.wmVideo
{
	public class SetGuidesVO extends Object
	{
		// Required
		public var bottomGuide:String = "bottom";
		public var leftGuide:String = "left";
		public var rightGuide:String = "right";
		public var topGuide:String = "top";
		
		// Optional
		public var bottomMargin:Number = 0;
		public var leftMargin:Number = 0;
		public var rightMargin:Number = 0;
		public var topMargin:Number = 0;
		
		public function SetGuidesVO()
		{
			super();
		}
	}
}