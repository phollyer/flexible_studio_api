package api.vos.sysTools
{
	[Bindable]
	public class ResizeImageVO extends Object
	{
		public var destination:String = null;
		public var height:Number = -1;
		public var quality:Number = -1;
		public var source:String = null;
		public var width:Number = -1;
		
		public function ResizeImageVO()
		{
			super();
		}
		
	}
}