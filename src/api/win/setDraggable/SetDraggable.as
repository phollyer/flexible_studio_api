package api.win.setDraggable
{
	import flash.events.IEventDispatcher;
	import api.win.Win;
	
	[Bindable]
	public class SetDraggable extends Win
	{
		// Optional
		public var flag:Boolean = true;
		
		public function SetDraggable(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setDraggable():void
		{
			ssCore.Win.setDraggable( {flag:flag}
								 	,{callback:actionComplete, errorSTR:"setDraggableError", code:"6022"} );
		}
	}
}