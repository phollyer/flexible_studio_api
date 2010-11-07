package api.vos.activeX
{
	[Bindable]
	public class CreateObjectVO extends Object
	{
		public var left:Number = 0;
		public var top:Number = 0;
		public var width:Number = 500;
		public var height:Number = 400;
		public var visible:Boolean = true;
		public var licence:String = null;
		
		public function CreateObjectVO()
		{
			super();
		}		
	}
}