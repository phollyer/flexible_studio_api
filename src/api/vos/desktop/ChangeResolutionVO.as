package swfStudio.vos.desktop
{
	[Bindable]
	public class ChangeResolutionVO extends Object
	{
		// Required
		public var colorDepth:Number = 32;
		public var height:Number = 1024;
		public var width:Number = 768;
		
		// Optional
		public var permanent:Boolean = false;
		public var refreshRate:Number = -1;
		public var useDirectDraw:Boolean = false;
		
		public function ChangeResolutionVO()
		{
			super();
		}
		
	}
}