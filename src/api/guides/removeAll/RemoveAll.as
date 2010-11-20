package api.guides.removeAll
{
	import api.events.guides.removeAll.RemoveAllEvent;

	import api.guides.Guides;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_removeAll.html Northcode Help Documentation
	*/
	public class RemoveAll extends Guides
	{
		/**
		* Constructor for Guides.RemoveAll()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_removeAll.html Northcode Help Documentation
		*/
		public function RemoveAll(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Guides_removeAll.html Northcode Help Documentation
		*/
		public function removeAll():void
		{
			ssCore.Guides.removeAll( {}
									,{callback:actionComplete, errorSTR:"removeAllError", code:"21001"} );
		}
	}
}