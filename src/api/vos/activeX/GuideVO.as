package api.vos.activeX
{
	[Bindable]
	public class GuideVO extends Object
	{
		public var bottomGuide:String = "bottom";
		public var leftGuide:String = "left";
		public var rightGuide:String = "right";
		public var topGuide:String = "top";
		public var bottomMargin:Number = 0;
		public var leftMargin:Number = 0;
		public var rightMargin:Number = 0;
		public var topMargin:Number = 0;
		
		public function GuideVO()
		{
			super();
		}
		
	}
}