package api.tooltip.hide
{
	import api.events.tooltip.hide.HideEvent;

	import api.tooltip.Tooltip;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_hide.html Northcode Help Documentation
	*/
	public class Hide extends Tooltip
	{
		/**
		* Constructor for Tooltip.Hide()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_hide.html Northcode Help Documentation
		*/
		public function Hide(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Tooltip_hide.html Northcode Help Documentation
		*/
		public function hide():void
		{
			ssCore.Tooltip.hide( {}
							    ,{callback:actionComplete, errorSTR:"hideError", code:"41000"} );
		}
	}
}