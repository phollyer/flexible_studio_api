package api.vos.app.showFileSave
{
	import api.vos.app.style.DialogListViewStyleVO;
	import api.vos.globals.Globals;
	[Bindable]
	public class ShowFileSaveVO extends Object
	{		
		public var caption:String = "Open File";
		public var fileName:String = null;
		public var filter:String = "All Files|*.*||";
		public var path:String = Globals.APPLICATION_START_DIR;
		public var style:String = DialogListViewStyleVO.DETAILS;
		
		public function ShowFileSaveVO()
		{
			super();
		}
		
	}
}