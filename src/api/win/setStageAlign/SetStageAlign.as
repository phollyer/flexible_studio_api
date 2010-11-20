package api.win.setStageAlign
{
	import api.events.win.setStageAlign.SetStageAlignEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setStageAlign.html Northcode Help Documentation
	*/
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
		/**
		* 
		*
		* @defaultValue <code>ALIGN_TOP_LEFT</code>
		*/
		public var align:String = ALIGN_TOP_LEFT;
		
		/**
		* Constructor for Win.SetStageAlign()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setStageAlign.html Northcode Help Documentation
		*/
		public function SetStageAlign(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_setStageAlign.html Northcode Help Documentation
		*/
		public function setStageAlign():void
		{
			ssCore.Win.setStageAlign( {align:align}
								 	 ,{callback:actionComplete, errorSTR:"setStageAlignError", code:"6029"} );
		}
	}
}