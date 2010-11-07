package api.win.setSmartDrag
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetSmartDrag extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function SetSmartDrag(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setSmartDrag():void
		{
			ssCore.Win.setSmartDrag( {flag:flag}
								 	,{callback:actionComplete, errorSTR:"setSmartDragError", code:"6028"} );
		}
	}
}