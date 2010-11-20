package api.win.setStageAlign
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetStageAlign extends Win
	{
		public static const ALIGN_BOTTOM:String = "B";
		public static const ALIGN_BOTTOM_LEFT:String = "BL";
		public static const ALIGN_BOTTOM_RIGHT:String = "BR";
		public static const ALIGN_LEFT:String = "L";
		public static const ALIGN_RIGHT:String = "R";
		public static const ALIGN_TOP:String = "T";
		public static const ALIGN_TOP_LEFT:String = "L";
		public static const ALIGN_TOP_RIGHT:String = "R";
		
		// Optional
		public var align:String = ALIGN_TOP_LEFT;
		
		public function SetStageAlign(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setStageAlign():void
		{
			ssCore.Win.setStageAlign( {align:align}
								 	 ,{callback:actionComplete, errorSTR:"setStageAlignError", code:"6029"} );
		}
	}
}