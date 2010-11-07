package api.win.getStageAlign
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.win.getStageAlign.GetStageAlignEvent;
	import api.win.Win;
	
	[Event(name="result", type="api.events.win.getStageAlign.GetStageAlignEvent")]
	[Bindable]
	public class GetStageAlign extends Win
	{
		// Result
		public var alignment:String = null;
		
		public function GetStageAlign(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getStageAlign():void
		{
			ssCore.Win.getStageAlign( {}
									 ,{callback:actionComplete, errorSTR:"getStageAlignError", code:"6006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			alignment = r.result;
			
			var e : GetStageAlignEvent = new GetStageAlignEvent( GetStageAlignEvent.RESULT );
			e.alignment = alignment;
			dispatchEvent( e );
		}
	}
}