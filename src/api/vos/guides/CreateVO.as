package swfStudio.vos.guides
{
	[Bindable]
	public class CreateVO extends Object
	{
		public static const HORIZONTAL:String = "HORIZONTAL";
		public static const VERTICAL:String = "VERTICAL";
		
		public static const BOTTOM:String = "bottom";
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		public static const TOP:String = "top";
		
		// Optional
		public var lower:String = LEFT;
		public var upper:String = RIGHT;
		
		// Required
		public var name:String = null;
		public var offset:Object = null;
		public var orientation:String = VERTICAL;
		
		public function CreateVO()
		{
			super();
		}
		
	}
}