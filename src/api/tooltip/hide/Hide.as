package api.tooltip.hide
{
	import flash.events.IEventDispatcher;
	import api.tooltip.Tooltip;

	[Bindable]
	public class Hide extends Tooltip
	{
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function hide():void
		{
			ssCore.Tooltip.hide( {}
							    ,{callback:actionComplete, errorSTR:"hideError", code:"41000"} );
		}
	}
}