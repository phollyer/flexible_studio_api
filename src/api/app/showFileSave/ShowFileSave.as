package api.app.showFileSave
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.showFileSave.ShowFileSaveEvent;
	import api.vos.app.showFileSave.ShowFileSaveVO;

	[Event(name="missingFileOBJ" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.app.showFileSave.ShowFileSaveEvent")]
	[Bindable]
	public class ShowFileSave extends App
	{
		// Required
		public var fileSaveOBJ:ShowFileSaveVO = null;
		
		public function ShowFileSave(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function showFileSave( showFileSaveVO:ShowFileSaveVO ):void
		{
			fileSaveOBJ = compare( showFileSaveVO , fileSaveOBJ );
			switch( fileSaveOBJ )
			{
				case null:
					missingFileOBJ();
					break;
				default:
					ssCore.App.showFileSave( fileSaveOBJ , {callback:actionComplete, errorSTR:"showFileSaveError", code:"8019"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			var e : ShowFileSaveEvent = new ShowFileSaveEvent( ShowFileSaveEvent.RESULT );
			e.file = r.result;
			e.filterIndex = r.filterIndex;
			e.filterMask = r.filterMask;
			e.filterName = r.filterName;
			dispatchEvent( e );
		}
		private function compare( first:ShowFileSaveVO , second:ShowFileSaveVO ):ShowFileSaveVO
		{
			switch( first != null )
			{
				case true:
					second = first;
			}
			return second;
		}
	}
}